#docker-perfect-box

A (work in progress) web development docker image.

It contains:
 - zsh with oh-my-zsh
 - git
 - io.js
 - phantomjs, grunt, gulp

## How to use this image

You will run commands from within your Docker container.

You want to mount your development (project) folder as a volume
and run the command.

### Example: run `npm install` in your project

```
docker run -v /path/to/your/project:/development ricca509/perfect_box npm install
```
