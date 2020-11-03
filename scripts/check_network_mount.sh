#!/bin/bash
message="${1:-'pi@pi3.lan'}"

out=$(ssh $1 <<'EOF'
  while IFS= read -r line; do
    printf 'Data : %s\n' "$line"
  done < "data.txt"
EOF
)
