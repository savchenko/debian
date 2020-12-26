#!/usr/bin/env bash

# swaymsg -t get_tree | jq -r '
#         # descend to workspace or scratchpad
#         .nodes[].nodes[]
#         # save workspace name as .w
#         | {"w": .name} + (
#                 if .nodes then # workspace
#                         [recurse(.nodes[])]
#                 else # scratchpad
#                         []
#                 end
#                 + .floating_nodes
#                 | .[]
#                 # select nodes with no children (windows)
#                 | select(.nodes==[])
#         )
#         | ((.id | tostring) + "\t "
#         # remove markup and index from workspace name, replace scratch with "[S]"
#         + (.w | gsub("^[^:]*:|<[^>]*>"; "") | sub("__i3_scratch"; "[S]"))
#         + "\t " +  .name)
#         ' | wofi --show dmenu --prompt='>_' | {
#     read -r id name
#     swaymsg "[con_id=$id]" focus
# }

# Yeah, I know...
swaymsg -t get_tree | jq -r '.nodes[].nodes[] | {"w": .name} + (if .nodes then [recurse(.nodes[])] else [] end + .floating_nodes | .[] | select(.nodes==[])) | ((.id | tostring) + "\t " + (.w | gsub("^[^:]*:|<[^>]*>"; "") | sub("__i3_scratch"; "[S]")) + "\t " +  .name)' | sort -V -k1 -t " " | head -n -1 | wofi --sort-order=alphabetical --width=800 --show dmenu --prompt=">_" | {
  read -r id name
  swaymsg "[con_id=$id]" focus
}
