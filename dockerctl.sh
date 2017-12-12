#!/bin/bash

# Start|Stop Docker from MacOS terminal
# Usage: ./dockerctl.sh                                                                                                                         ~

docker_start(){
    open -g -W /Applications/Docker.app &
}

docker_stop(){
    osascript -e 'quit app "Docker"'
}

docker_status(){
    pgrep -q Docker && echo "Docker is Running" || echo "Docker is Stopped"
}


options=("start" "stop" "status")
select opt in "${options[@]}"
do
    case $opt in
        start)
            echo "Starting Docker..."
	    docker_start
	    exit 0
	    ;;
        stop)
            echo "Stopping Docker..."
	    docker_stop
	    exit 0
	    ;;
        status)
	    docker_status
            exit 0
            ;;
        *) echo "Invalid selection..."
           exit 127
	   ;;
    esac
done