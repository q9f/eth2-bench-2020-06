#!/usr/bin/env ruby

require 'net/http'
require 'uri'
require 'json'

@HOST = "127.0.0.1"
@PORT = 5052
@DATA = "$HOME/.lighthouse/beacon/chain_db/"

def get_peer_count
	begin
		uri = URI.parse("http://#{@HOST}:#{@PORT}/network/peer_count")
		response = Net::HTTP.get_response(uri)
		peer_count = response.body.to_i
	rescue
		peer_count = -9
	end
end

def get_slot_height
	begin
		uri = URI.parse("http://#{@HOST}:#{@PORT}/beacon/head")
		response = Net::HTTP.get_response(uri)
		slot_height = JSON.parse(response.body)["slot"].to_i
	rescue
		slot_height = -9
	end
end

def get_database_size
	begin
		database_size = `du -bs #{@DATA} 2> /dev/null`.to_i
	rescue
		database_size = -9
	end
end

def get_memory_usage
	begin
		uri = URI.parse("http://#{@HOST}:#{@PORT}/node/health")
		response = Net::HTTP.get_response(uri)
		memory_usage = JSON.parse(response.body)["pid_mem_resident_set_size"].to_i
	rescue
		memory_usage = -9
	end
end

def get_unix_time
	Time.now.utc.to_i
end

print "time,db,mem,slot,bps,peers\n"
prev_h = 0
prev_t = get_unix_time

loop do
	t = get_unix_time
	c = get_peer_count
	h = get_slot_height
	s = get_database_size
	m = get_memory_usage
	dt = t.to_f - prev_t.to_f
	b = 0.0
	if dt > 0
		b = (h.to_f - prev_h.to_f) / dt
	end

	print "#{t},#{s},#{m},#{h},#{b},#{c}\n"

	prev_t = t
	prev_h = h
	sleep 1
end
