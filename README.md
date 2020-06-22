# Multi-client benchmark on Witti testnet 2020/06/22
Preliminary, high-level ETH2-client benchmarks.
- [ ] Lighthouse
- [ ] Prysm
- [ ] Teku

_This is work in progress._

### Host systems (3x)
- VPS: Scaleway DEV1-XL _(*)_
- OS: Arch Linux, kernel 5.7.2-arch1-1
- CPU: AMD EPYC 7281, 4 vCPUs
- RAM: 12 GB
- Disk: 120GB NVMe

_*) Note, this is a preliminary, high-level benchmark that should be repeated in future on bare-metal machines after stable client-releases are available to eliminate potential performance invariances caused by virtualized systems._

### Lighthouse
- `lighthouse/0.1.2`
- `master` @ 710409c2bafbd118ac8a9a4115ed7a8abfe9929a
- Rust `1.44.1`, Cargo `1.44.1`
- Permalink: https://github.com/sigp/lighthouse/tree/710409c2bafbd118ac8a9a4115ed7a8abfe9929a
- Script:
    ```
    lighthouse bn --http \
      --boot-nodes enr:-LK4QAYhCMLHcsnFLZzXKKOWzPWe6z4FVdDTDQp2kDos18XCHZ3PrEx96jQb7AVQodQoidMiWrpLeWpmxaqC5ykls7MBh2F0dG5ldHOIAAAAAAAAAACEZXRoMpD2d10HAAABE___________gmlkgnY0gmlwhLAJM9iJc2VjcDI1NmsxoQICPr5ScM4EYN_y-Z5H_zHXo_svCpLfYwBkoTpTGfzqS4N0Y3CCNLyDdWRwgjDU,enr:-LK4QGPVYkltsUMnAXgBV--mL4kXSj994puCqk_eYJekqeSKI1dlrB5j8w7A4wTlQ2q7Z_7FL0hb1_GLm8HFHaI_ofABh2F0dG5ldHOIAAAAAAAAAACEZXRoMpD2d10HAAABE___________gmlkgnY0gmlwhLAJM9iJc2VjcDI1NmsxoQNe8ACI4KvKjv0tXo_FshDZPQgKo89OEgX2PS-PPq3A04N0Y3CCJRyDdWRwgiUc,enr:-KG4QHEX3tQcaBo-VAw1nczH3_p_A3rdMKjFZ2x8vafwNDmYcAmrC2aq9_kMiRMIGj8--7VTDPTnz7iYVuNIbXuLL7kDhGV0aDKQ9nddBwAAARP__________4JpZIJ2NIJpcISwCTPYiXNlY3AyNTZrMaEC2g-nqtWmZanb7ZcECev8HgKVKNC2IboEvoN_OChVwceDdGNwgnUwg3VkcIJ1MA,enr:-Ku4QJsxkOibTc9FXfBWYmcdMAGwH4bnOOFb4BlTHfMdx_f0WN-u4IUqZcQVP9iuEyoxipFs7-Qd_rH_0HfyOQitc7IBh2F0dG5ldHOIAAAAAAAAAACEZXRoMpD1pf1CAAAAAP__________gmlkgnY0gmlwhLAJM9iJc2VjcDI1NmsxoQL2RyM26TKZzqnUsyycHQB4jnyg6Wi79rwLXtaZXty06YN1ZHCCW8w,enr:-LK4QKTkBk3I1y4__nfX18Jdhcko2ExQzqpr8byjTB7t8HVFTLKNvipBZbPItODKWFdhBVN8vVh89ScZPdSTNoiLXXoBh2F0dG5ldHOIAAAAAAAAAACEZXRoMpD2d10HAAABE___________gmlkgnY0gmlwhLAJM9iJc2VjcDI1NmsxoQICvB04SDhZK46nvJmm6GZvo8RsKctq4uWK6jQRZBxewoN0Y3CCIyiDdWRwgiMo,enr:-LK4QO-InqtcvYyJysIC8m-GimjQxeh2fMYNg557rfLD3iOtK5rZo6-1N09tw0NeIt4ht2rLtCNS6NGwU38qarXaVUMBh2F0dG5ldHOIAAAAAAAAAACEZXRoMpD2d10HAAABE___________gmlkgnY0gmlwhLAJM9iJc2VjcDI1NmsxoQISU9N1Kj03Z-IBVlevP56X9qkZxA1fv62TLRKlfzI1LYN0Y3CCMsiDdWRwgi7g,enr:-KG4QOWbLS8XipfTFUjjaboBG8F4fkw7YtSSvvenmlGz6z8LeknOAxokwlhQWwiV3AftLgreD8hC94EnXdYzw93aVdQDhGV0aDKQ9nddBwAAARP__________4JpZIJ2NIJpcISwCTPYiXNlY3AyNTZrMaECLYJchUH6A-oyZenBKm5hLwIDy6xZqksxOt24irvEOEuDdGNwgnUwg3VkcIJ1MA >& /home/user/witti/light.log
    ```

### Prysm
- `Prysm/Git commit: 172435374d07982a8f15b0ceb042b53ce284fa7e. Built at: 2020-06-22T10:55:28+02:00`
- `witti` @ 172435374d07982a8f15b0ceb042b53ce284fa7e
- Go 1.14.4, Bazel 3.2.0
- Permalink: https://github.com/prysmaticlabs/prysm/tree/172435374d07982a8f15b0ceb042b53ce284fa7e
- Script:
    ```
    beacon-chain --witti-testnet \
      --initial-sync-verify-all-signatures \
      --bootstrap-node enr:-LK4QAYhCMLHcsnFLZzXKKOWzPWe6z4FVdDTDQp2kDos18XCHZ3PrEx96jQb7AVQodQoidMiWrpLeWpmxaqC5ykls7MBh2F0dG5ldHOIAAAAAAAAAACEZXRoMpD2d10HAAABE___________gmlkgnY0gmlwhLAJM9iJc2VjcDI1NmsxoQICPr5ScM4EYN_y-Z5H_zHXo_svCpLfYwBkoTpTGfzqS4N0Y3CCNLyDdWRwgjDU,enr:-LK4QGPVYkltsUMnAXgBV--mL4kXSj994puCqk_eYJekqeSKI1dlrB5j8w7A4wTlQ2q7Z_7FL0hb1_GLm8HFHaI_ofABh2F0dG5ldHOIAAAAAAAAAACEZXRoMpD2d10HAAABE___________gmlkgnY0gmlwhLAJM9iJc2VjcDI1NmsxoQNe8ACI4KvKjv0tXo_FshDZPQgKo89OEgX2PS-PPq3A04N0Y3CCJRyDdWRwgiUc,enr:-KG4QHEX3tQcaBo-VAw1nczH3_p_A3rdMKjFZ2x8vafwNDmYcAmrC2aq9_kMiRMIGj8--7VTDPTnz7iYVuNIbXuLL7kDhGV0aDKQ9nddBwAAARP__________4JpZIJ2NIJpcISwCTPYiXNlY3AyNTZrMaEC2g-nqtWmZanb7ZcECev8HgKVKNC2IboEvoN_OChVwceDdGNwgnUwg3VkcIJ1MA,enr:-Ku4QJsxkOibTc9FXfBWYmcdMAGwH4bnOOFb4BlTHfMdx_f0WN-u4IUqZcQVP9iuEyoxipFs7-Qd_rH_0HfyOQitc7IBh2F0dG5ldHOIAAAAAAAAAACEZXRoMpD1pf1CAAAAAP__________gmlkgnY0gmlwhLAJM9iJc2VjcDI1NmsxoQL2RyM26TKZzqnUsyycHQB4jnyg6Wi79rwLXtaZXty06YN1ZHCCW8w,enr:-LK4QKTkBk3I1y4__nfX18Jdhcko2ExQzqpr8byjTB7t8HVFTLKNvipBZbPItODKWFdhBVN8vVh89ScZPdSTNoiLXXoBh2F0dG5ldHOIAAAAAAAAAACEZXRoMpD2d10HAAABE___________gmlkgnY0gmlwhLAJM9iJc2VjcDI1NmsxoQICvB04SDhZK46nvJmm6GZvo8RsKctq4uWK6jQRZBxewoN0Y3CCIyiDdWRwgiMo,enr:-LK4QO-InqtcvYyJysIC8m-GimjQxeh2fMYNg557rfLD3iOtK5rZo6-1N09tw0NeIt4ht2rLtCNS6NGwU38qarXaVUMBh2F0dG5ldHOIAAAAAAAAAACEZXRoMpD2d10HAAABE___________gmlkgnY0gmlwhLAJM9iJc2VjcDI1NmsxoQISU9N1Kj03Z-IBVlevP56X9qkZxA1fv62TLRKlfzI1LYN0Y3CCMsiDdWRwgi7g,enr:-KG4QOWbLS8XipfTFUjjaboBG8F4fkw7YtSSvvenmlGz6z8LeknOAxokwlhQWwiV3AftLgreD8hC94EnXdYzw93aVdQDhGV0aDKQ9nddBwAAARP__________4JpZIJ2NIJpcISwCTPYiXNlY3AyNTZrMaECLYJchUH6A-oyZenBKm5hLwIDy6xZqksxOt24irvEOEuDdGNwgnUwg3VkcIJ1MA >& /home/user/witti/prysm.log
    ```

### Teku
- `teku/v0.11.5-dev-3bd72680/linux-x86_64/-na-openjdk64bitservervm-java-14`
- `master` @ 3bd726809afe32296bc0b480168e380f66702354
- Java `14.0.1`, Gradle `6.5`
- Permalink: https://github.com/PegaSysEng/teku/tree/3bd726809afe32296bc0b480168e380f66702354
- Script:
    ```
    teku --config-file="/home/user/witti/teku/config.yaml" \
      --network="/home/user/witti/teku/chain.yaml" &> /home/user/witti/teku.log
    ```
- Config:
    ```
    network: "/home/user/witti/teku/chain.yaml"
    initial-state: "/home/user/witti/teku/genesis.ssz"
    eth1-deposit-contract-address: "0x42cc0FcEB02015F145105Cf6f19F90e9BEa76558"
    logging: "INFO"
    log-color-enabled: true
    log-include-events-enabled: true
    p2p-enabled: true
    p2p-discovery-enabled: true
    p2p-snappy-enabled: true
    p2p-discovery-bootnodes:
      - "enr:-Ku4QJsxkOibTc9FXfBWYmcdMAGwH4bnOOFb4BlTHfMdx_f0WN-u4IUqZcQVP9iuEyoxipFs7-Qd_rH_0HfyOQitc7IBh2F0dG5ldHOIAAAAAAAAAACEZXRoMpD1pf1CAAAAAP__________gmlkgnY0gmlwhLAJM9iJc2VjcDI1NmsxoQL2RyM26TKZzqnUsyycHQB4jnyg6Wi79rwLXtaZXty06YN1ZHCCW8w"
      - "enr:-LK4QKTkBk3I1y4__nfX18Jdhcko2ExQzqpr8byjTB7t8HVFTLKNvipBZbPItODKWFdhBVN8vVh89ScZPdSTNoiLXXoBh2F0dG5ldHOIAAAAAAAAAACEZXRoMpD2d10HAAABE___________gmlkgnY0gmlwhLAJM9iJc2VjcDI1NmsxoQICvB04SDhZK46nvJmm6GZvo8RsKctq4uWK6jQRZBxewoN0Y3CCIyiDdWRwgiMo"
      - "enr:-LK4QO-InqtcvYyJysIC8m-GimjQxeh2fMYNg557rfLD3iOtK5rZo6-1N09tw0NeIt4ht2rLtCNS6NGwU38qarXaVUMBh2F0dG5ldHOIAAAAAAAAAACEZXRoMpD2d10HAAABE___________gmlkgnY0gmlwhLAJM9iJc2VjcDI1NmsxoQISU9N1Kj03Z-IBVlevP56X9qkZxA1fv62TLRKlfzI1LYN0Y3CCMsiDdWRwgi7g"
      - "enr:-KG4QOWbLS8XipfTFUjjaboBG8F4fkw7YtSSvvenmlGz6z8LeknOAxokwlhQWwiV3AftLgreD8hC94EnXdYzw93aVdQDhGV0aDKQ9nddBwAAARP__________4JpZIJ2NIJpcISwCTPYiXNlY3AyNTZrMaECLYJchUH6A-oyZenBKm5hLwIDy6xZqksxOt24irvEOEuDdGNwgnUwg3VkcIJ1MA"
    rest-api-port: 5051
    rest-api-enabled: True
    rest-api-interface: "127.0.0.1"
    metrics-enabled: True
    ```

### Witti testnet
- Spec version: `v0.11.3`
- Circa `190_000` slots filled with circa 70% blocks at start time
- 3 different clients known to validate the network
- 5 different clients known to connect and sync the network
- Permalink: https://github.com/goerli/witti/tree/255cf1ab944ebad5a756116e81cd9079b65fae50

### Metrics collected
- `time`: Unix time in seconds
  - all: (Ruby) `Time.now.to_i`
- `db`: Database size in bytes
  - Lighthouse: (Shell) `du -bs $HOME/.lighthouse/beacon/chain_db/
  - Prysm: (Shell) `du -bs $HOME/.eth2/beaconchaindata/
  - Teku: (Shell) `du -bs $HOME/.local/share/teku/data/db/
- `mem`: Resident memory in bytes
  - Lighthouse: (REST API) `/node/health`, `.pid_mem_resident_set_size`
  - Prysm: (Metrics) `process_resident_memory_bytes`
  - Teku: (Metrics) `process_resident_memory_bytes`
- `slot`: Head slot number in 1
  - Lighthouse: (REST API) `/beacon/head`, `.slot`
  - Prysm: (gRPC API) `/eth/v1alpha1/beacon/chainhead`, `.headSlot`
  - Teku: (REST API) `/beacon/head`, `.slot`
- `bps`: Slot sync each second in 1/second _(*)_
  - all: (Ruby) `(h.to_f - prev_h.to_f) / dt`
- `peers`: Peer count in 1
  - Lighthouse: (REST API) `/network/peer_count`
  - Prysm: (gRPC API) `/eth/v1alpha1/node/peers` _(counted)_
  - Teku: (REST API) `/network/peer_count`

_*) Note, due to different ways of processing incoming badges of blocks, this metric should be recomputed based on an average taken over 60 seconds._

### Metrics derived
- Database size over sync time
- Database size over slot count
- Database size over slot count (future projection: 1Y, 5Y)
- Slot sync speed over time (moving average)
- Resident memory usage over time augmented with chain finality (external data)
