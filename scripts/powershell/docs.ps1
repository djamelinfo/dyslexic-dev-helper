function gs { git status }
function gadd { git add $args }
function gpush { git push $args }
function glog { git log --oneline --graph --decorate -n 15 }
function gco { git checkout $args }
function gdiff { git diff $args }
function gcom { git commit -m "$args" }  # (slightly different name than gcom)

function nano { notepad $args }

function .. { Set-Location .. }
function ... { Set-Location ../.. }
function dev { Set-Location "$HOME\dev" }  # Jump to your dev folder
function repos { Set-Location "$HOME\Documents\GitHub" }  # Example

Set-Alias ll Get-ChildItem
function re { . $PROFILE }  # Reload profile without restarting

function docs {
    param (
        [string]$topic = "all"
    )

    switch ($topic.ToLower()) {
        "git" {
            Write-Host "Git Commands" -ForegroundColor Cyan
            Write-Host ""
            Write-Host "Basics" -ForegroundColor Yellow
            Write-Host "  git status                     -> show repo status"
            Write-Host "  git add .                      -> stage all changes"
            Write-Host "  git commit -m 'message'        -> commit staged changes"
            Write-Host "  git log --oneline --graph -n 10-> compact history"
            Write-Host "  git push                       -> push current branch"
            Write-Host ""
            Write-Host "Branching" -ForegroundColor Yellow
            Write-Host "  git branch                     -> list branches"
            Write-Host "  git switch main                -> switch to main"
            Write-Host "  git switch -c feature/name     -> create + switch"
            Write-Host "  git fetch origin               -> fetch remote branches"
            Write-Host "  git switch -c feat origin/dev  -> new branch from remote branch"
            Write-Host ""
            Write-Host "Publish new branch" -ForegroundColor Yellow
            Write-Host "  git push -u origin my-branch   -> set upstream tracking"
            Write-Host ""
            Write-Host "Rename branch" -ForegroundColor Yellow
            Write-Host "  git branch -m new-name         -> rename current branch"
            Write-Host "  git branch -m old new          -> rename other branch"
            Write-Host "  git push origin -u new         -> push renamed branch"
            Write-Host "  git push origin --delete old   -> delete old remote branch"
            Write-Host ""
            Write-Host "Conventional Commits" -ForegroundColor Yellow
            Write-Host "  Format: <type>(<scope>): <description>" -ForegroundColor DarkGray
            Write-Host "  feat      -> new feature"
            Write-Host "  fix       -> bug fix"
            Write-Host "  docs      -> documentation only"
            Write-Host "  chore     -> tooling / maintenance"
            Write-Host "  style     -> formatting only"
            Write-Host "  refactor  -> code change w/o behavior change"
            Write-Host "  perf      -> performance"
            Write-Host "  test      -> tests only"
            Write-Host "  Example:" -ForegroundColor Yellow
            Write-Host "    feat(api): add retry logic"
            Write-Host "    fix(ci): correct pipeline path"
            Write-Host "    chore(deps): update requests to v2.32.3"
            Write-Host ""
        }

        "docker" {
            Write-Host "Docker Commands" -ForegroundColor Cyan
            Write-Host ""
            Write-Host "Basics" -ForegroundColor Yellow
            Write-Host "  docker ps                       -> list running containers"
            Write-Host "  docker images                   -> list images"
            Write-Host "  docker pull nginx               -> pull image"
            Write-Host "  docker rm <id>                  -> remove container"
            Write-Host "  docker rmi <id>                 -> remove image"
            Write-Host ""
            Write-Host "Build & Run" -ForegroundColor Yellow
            Write-Host "  docker build -t myimg .         -> build from Dockerfile"
            Write-Host "  docker run -it --rm myimg       -> run interactively"
            Write-Host "  docker run -d -p 8080:80 nginx  -> map port"
            Write-Host "  docker logs -f <id>             -> follow logs"
            Write-Host ""
            Write-Host "Compose" -ForegroundColor Yellow
            Write-Host "  docker compose up               -> start services"
            Write-Host "  docker compose down             -> stop and remove"
            Write-Host ""
            Write-Host "Cleanup" -ForegroundColor Yellow
            Write-Host "  docker system prune -a          -> remove unused data"
            Write-Host ""
        }

        "kube" {
            Write-Host "Kubernetes (kubectl)" -ForegroundColor Cyan
            Write-Host ""
            Write-Host "Basics" -ForegroundColor Yellow
            Write-Host "  kubectl get pods -A             -> list pods in all namespaces"
            Write-Host "  kubectl get svc -n ns           -> list services"
            Write-Host "  kubectl describe pod <name> -n ns-> pod details"
            Write-Host "  kubectl logs -f <pod> -n ns     -> follow pod logs"
            Write-Host "  kubectl config get-contexts     -> list contexts"
            Write-Host "  kubectl config use-context <ctx>-> switch context"
            Write-Host ""
        }

        "rancher" {
            Write-Host "Rancher Desktop" -ForegroundColor Cyan
            Write-Host ""
            Write-Host "nerdctl (Docker alternative)" -ForegroundColor Yellow
            Write-Host "  nerdctl ps                      -> list containers"
            Write-Host "  nerdctl images                  -> list images"
            Write-Host "  nerdctl build -t myimg .        -> build image"
            Write-Host "  nerdctl compose up              -> run compose"
            Write-Host "  nerdctl system prune -a         -> cleanup"
            Write-Host ""
            Write-Host "Kubernetes health" -ForegroundColor Yellow
            Write-Host "  kubectl get nodes               -> cluster status"
            Write-Host "  Restart K8s from Rancher UI if context fails"
            Write-Host ""
        }

        "ps" {
            Write-Host "PowerShell" -ForegroundColor Cyan
            Write-Host ""
            Write-Host "System" -ForegroundColor Yellow
            Write-Host "  $PSVersionTable.PSVersion       -> show PowerShell version"
            Write-Host "  Get-Process                     -> list processes"
            Write-Host "  Get-Service                     -> list services"
            Write-Host ""
            Write-Host "Files" -ForegroundColor Yellow
            Write-Host "  Get-ChildItem (ls/dir)          -> list files"
            Write-Host "  Set-Location path (cd)          -> change directory"
            Write-Host "  Copy-Item a -Destination b      -> copy"
            Write-Host "  Move-Item a -Destination b      -> move/rename"
            Write-Host "  Remove-Item path                -> delete"
            Write-Host ""
            Write-Host "Help & history" -ForegroundColor Yellow
            Write-Host "  Get-Help <cmd> -Online          -> open docs"
            Write-Host "  Get-Command                     -> list commands"
            Write-Host "  Get-History                     -> recent commands"
            Write-Host ""
            Write-Host "Network" -ForegroundColor Yellow
            Write-Host "  Test-Connection example.com     -> ping"
            Write-Host "  Get-NetIPAddress                -> IP info"
            Write-Host "  Get-NetAdapter                  -> adapters"
            Write-Host ""
            Write-Host "Profile" -ForegroundColor Yellow
            Write-Host "  code $PROFILE                   -> edit profile"
            Write-Host "  . $PROFILE                      -> reload profile"
            Write-Host ""
        }

        "uv" {
            Write-Host "UV (Python)" -ForegroundColor Cyan
            Write-Host ""
            Write-Host "Basics" -ForegroundColor Yellow
            Write-Host "  uv init                         -> create pyproject"
            Write-Host "  uv add requests                 -> add dependency"
            Write-Host "  uv remove requests              -> remove dependency"
            Write-Host "  uv sync                         -> install from lock"
            Write-Host "  uv pip list                     -> list packages"
            Write-Host ""
            Write-Host "Run" -ForegroundColor Yellow
            Write-Host "  uv run script.py                -> run in env"
            Write-Host "  uv run --with requests a.py     -> run with extra dep"
            Write-Host "  uv run --native-tls a.py        -> fix SSL behind proxy"
            Write-Host ""
            Write-Host "Env" -ForegroundColor Yellow
            Write-Host "  uv venv                         -> create venv"
            Write-Host "  uv python list                  -> list Python versions"
            Write-Host "  uv python install 3.12          -> install Python"
            Write-Host ""
            Write-Host "Tips" -ForegroundColor Yellow
            Write-Host "  $env:UV_NATIVE_TLS = '1'        -> trust system certs"
            Write-Host "  uv cache prune                  -> clear caches"
            Write-Host ""
        }

        default {
            Write-Host "Available topics: git, docker, kube, rancher, ps, uv" -ForegroundColor Cyan
            Write-Host "Example: docs git" -ForegroundColor DarkGray
            Write-Host ""
        }
    }
}

