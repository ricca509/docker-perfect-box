#docker-perfect-box

A (work in progress) web development docker image.

It contains:
 - zsh with oh-my-zsh
 - git
 - io.js
 - phantomjs, grunt, gulp
 - google-chrome-stable

## How to use the image

You will run commands from within your Docker container.

You want to mount your development (project) folder as a volume
and run the command.

### Example: run `npm install` in your project

```
docker run -ti -v /path/to/your/project:/development ricca509/perfect_box npm install
```

If you move inside your project folder you can then use:

```
docker run -ti -v $(pwd):/development ricca509/perfect_box npm install
```

### Setup an alias
If you always move inside your project folder before running any command,
you can setup a generic alias:

```
alias docker-box='docker run -ti --rm -v $(pwd):/development ricca509/perfect_box'
```

and then use:

```
docker-box npm install
```
