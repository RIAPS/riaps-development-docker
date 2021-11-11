This is based upon https://github.com/adubey14/data-science-docker-vscode-template.git

```
docker build -t code-server .
docker run -p 8443:8443 -p 2222:2222  -v $(pwd)/code:/code  -v $(pwd)/extensions:/extensions --rm -it code-server 
```

VSCode will be running on:

http://localhost:8443

Extensions will be in extensions folder.

JupyterLab will be running on:

http://localhost:2222 with a token of `riaps`

## add a package

add to requirements.xt
rebuild docker and restart it

```
docker build -t code-server .
docker run -p 8443:8443 -p 2222:2222  -v $(pwd)/code:/code  -v $(pwd)/extensions:/extensions --rm -it code-server 
```

