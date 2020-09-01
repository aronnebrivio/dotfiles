function startPortainer -a port -d "Start Portainer in a Docker container exposed to the given port as 1st parameter"
    if not type -q docker
        echo "There is no Docker on this machine, you should install it first."
        exit 1
    end

    # Remove old container
    docker rm --force portainer

    # Ensures it always uses the latest version
    docker pull portainer/portainer-ce

    # Fallback to default port if not set
    set -q port[1]; or set port 9999

    # Run Docker container
    docker run --name portainer --restart=unless-stopped -d -p $port:9000 -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce

end
