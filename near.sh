#!/bin/bash

RPC_URL="https://near.lava.build/lava-referer-337b9652-8927-434a-8ec0-11dc1d4a2ef4/"

OUTPUT_DIR="logs"

near_data=$(curl -s -H "Content-Type: application/json" -X POST --data '{"jsonrpc":"2.0","method":"block","id":"HappyCuanAirdrop","params":{"finality":"final"}}' "$RPC_URL")

if [ $? -eq 0 ]; then
    if [ ! -d "$OUTPUT_DIR" ]; then
        mkdir "$OUTPUT_DIR"
    fi
    
    echo "$near_data" >> "$OUTPUT_DIR/near.txt"
    
    echo "NEAR data fetched and saved to $OUTPUT_DIR/near.txt."
else
    echo "Failed to fetch NEAR data."
fi
