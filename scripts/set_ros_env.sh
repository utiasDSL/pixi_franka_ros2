export ROS_DOMAIN_ID=100
# export RMW_IMPLEMENTATION=rmw_zenoh_cpp
# export ZENOH_ROUTER_CHECK_ATTEMPTS=-1
# export ZENOH_CONFIG_OVERRIDE='listen/endpoints=["tcp/10.157.163.121:7447"];scouting/multicast/enabled=true'

export RMW_IMPLEMENTATION=rmw_cyclonedds_cpp
export ROS_NETWORK_INTERFACE="enx607d0937fb24"


SCRIPT_PATH="$(realpath "${BASH_SOURCE[0]}")"
SCRIPT_DIR="$(dirname "$SCRIPT_PATH")"
REPO_DIR="$(dirname "$SCRIPT_DIR")"

export CYCLONEDDS_URI=file:///$SCRIPT_DIR/cyclone_config.xml

# Source the correct workspace overlay based on ROS_DISTRO when available.
if [ -n "$ROS_DISTRO" ] && [ -f "$REPO_DIR/install_${ROS_DISTRO}/setup.bash" ]; then
	. "$REPO_DIR/install_${ROS_DISTRO}/setup.bash"
elif [ -f "$REPO_DIR/install/setup.bash" ]; then
	. "$REPO_DIR/install/setup.bash"
fi

ros2 daemon stop && ros2 daemon start

