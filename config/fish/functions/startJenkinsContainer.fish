function startJenkinsContainer -a port -d "Start Jenkins in a Docker container exposed to the given port as 1st parameter"
    if not type -q docker
        echo "There is no Docker on this machine, you should install it first."
        exit 1
    end

    # Ensures it always uses the latest version
    docker pull jenkinsci/blueocean

    # Fallback to default port if not set
    set -q port[1]; or set port 9876

    # Run Docker container
    docker run --name jenkins -u root --rm -d \
        -p $port:8080 \
        -p 50000:50000 \
        -v jenkins-data:/var/jenkins_home \
        -v jenkins-root:/root \
        -v /var/run/docker.sock:/var/run/docker.sock \
        jenkinsci/blueocean
end
