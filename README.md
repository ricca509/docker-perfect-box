# docker-perfect-box

[![](https://images.microbadger.com/badges/image/ricca509/perfect-box.svg)](https://microbadger.com/images/ricca509/perfect-box "Get your own image badge on microbadger.com")

A web development docker image.

It contains:
 - zsh with oh-my-zsh
 - git
 - node.js
 - perl

 All the rest should be an internal dependency of your project.

## How to use the image

You will run commands from within your Docker container.

You want to mount your development (project) folder as a volume
and run the command.

### Example: run `npm install` in your project

```
docker run --rm -ti -v /path/to/your/project:/development ricca509/perfect-box npm install
```

If you move inside your project folder you can then use:

```
docker run --rm -ti -v $(pwd):/development ricca509/perfect-box npm install
```
or, in Powershell

```
$here = ($pwd.Path -replace '\\','/' -replace 'C:','//c'); docker run --rm -ti -v ${here}:/development ricca509/perfect-box npm install


```

### Setup an alias
If you always move inside your project folder before running any command,
you can setup a generic alias:

```
alias docker-box='docker run -ti --rm -v $(pwd):/development ricca509/perfect-box'
```

and then use:

```
docker-box npm install
```
