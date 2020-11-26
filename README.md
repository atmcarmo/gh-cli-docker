# gh-cli-docker
Docker Image to use GitHub's GH CLI tool as a container: https://github.com/cli/cli

To use this docker image as a short lived container it is advised to create a GitHub token and put it in an environment variable.
Example for ZSH shell

```
GITHUB_TOKEN=<YOUR_GH_TOKEN>
docker pull atmcarmo/gh:<tag>
docker run -e GITHUB_TOKEN=${GITHUB_TOKEN} -v $(pwd):/app -w /app atmcarmo/gh:latest gh <command>
```

All tags available here: https://hub.docker.com/r/atmcarmo/gh/tags?page=1&ordering=last_updated

To create an alias to run in your shell
`~/.zshrc` (as an example)
```
GITHUB_TOKEN=<YOUR_GH_TOKEN>
alias gh='docker run -e GITHUB_TOKEN=${GITHUB_TOKEN} -v $(pwd):/app -w /app atmcarmo/gh:latest gh'
```

Then to run
`gh <your command>`. Example: `gh pr list`

See how to use GH CLI here: https://cli.github.com/manual/

# Known issues:
Currently the command `gh pr create --web` doesn't work as `xdg-open` is not available in the docker image.