<div align=center>

# KPSML-X on Heroku Deploy using Google Colab

<p>
    <a href="https://github.com/Tamilupdates/KPSML-X">
        <kbd>
            <img src="https://graph.org/file/879239eb830dd6c00b07e.jpg" width="550" alt="KPSML-X Logo">
        </kbd>
    </a>
</p>

### <img src="https://graph.org/file/504ba776ef0724a4ae85b.png" width="25" alt="Google Colab Logo"> Google Colab : [Deploy Link](https://colab.research.google.com/drive/1ntoqoj3jDq2FtU2-joizh0DO64uoec9q)

</div>

---

## Deployment Guide (VPS)

<details>
  <summary><strong>View All Steps  <kbd>Click Here</kbd></strong></summary>

---

## 1. Prerequisites

- **Tutorial Video from A to Z (Latest Video)**
- Special thanks to [Wiszky](https://github.com/vishnoe115)

[![See Video](https://img.shields.io/badge/See%20Video-black?style=for-the-badge&logo=YouTube)](https://youtu.be/xzLOLyKYl54)

---

## 2. Installing Requirements

Clone this repository:

```bash
git clone https://github.com/Tamilupdates/KPSML-X kpsml-x && cd kpsml-x
```

---

## 3. Build and Run the Docker Image

*Make sure you mount the app folder and install Docker following the official documentation.*

There are two methods to build and run the Docker image:

### 3.1 Using Official Docker Commands

- **Start Docker daemon** (skip if already running):

  ```bash
  sudo dockerd
  ```

- **Build the Docker image:**

  ```bash
  sudo docker build . -t kpsmlx
  ```

- **Run the image:**

  ```bash
  sudo docker run -p 80:80 -p 8080:8080 kpsmlx
  ```

- **To stop the running image:**

  First, list running containers:

  ```bash
  sudo docker ps
  ```

  Then, stop the container using its ID:

  ```bash
  sudo docker stop <container_id>
  ```

---

### 3.2 Using docker-compose (Recommended)

**Note:** If you want to use ports other than 80 and 8080 for torrent file selection and rclone serve respectively, update them in [docker-compose.yml](https://github.com/Tamilupdates/KPSML-X/blob/main/docker-compose.yml).

- **Install docker-compose:**

  ```bash
  sudo apt install docker-compose
  ```

- **Build and run the Docker image (or view the current running image):**

  ```bash
  sudo docker-compose up
  ```

- **After editing files (e.g., using nano to edit start.sh), rebuild:**

  ```bash
  sudo docker-compose up --build
  ```

- **To stop the running image:**

  ```bash
  sudo docker-compose stop
  ```

- **To restart the image:**

  ```bash
  sudo docker-compose start
  ```

- **To view the latest logs from the running container (after mounting the folder):**

  ```bash
  sudo docker-compose up
  ```

- **Tutorial Video for docker-compose and checking ports:**

  [![See Video](https://img.shields.io/badge/See%20Video-black?style=for-the-badge&logo=YouTube)](https://youtu.be/c8_TU1sPK08)


------

#### Docker Notes

**IMPORTANT NOTES**:

1. Set `BASE_URL_PORT` and `RCLONE_SERVE_PORT` variables to any port you want to use. Default is `80` and `8080` respectively.
2. You should stop the running image before deleting the container and you should delete the container before the image.
3. To delete the container (this will not affect on the image):

```
sudo docker container prune
```

4. To delete te images:

```
sudo docker image prune -a
```

5. Check the number of processing units of your machine with `nproc` cmd and times it by 4, then edit `AsyncIOThreadsCount` in qBittorrent.conf.
    
  </li></ol>
</details>

---

## **Deployment Guide (Heroku CLI)**
<details>
  <summary><strong>View All Steps  <kbd>Click Here</kbd></strong></summary>
  
---
  
**Step 1 :** Git clone this Repo and change directory

> Make sure git is Installed in your system or quick run `apt-get install git pip curl -y`

```shell
git clone https://github.com/Tamilupdates/KPSML-X kpsml-x && cd kpsml-x 
```

---

**Step 2 :** Now Install Heroku in your Sytem or checkout Official Heroku Deploy Docs, or Download via `apt-get` or `npm`

> For Android : Use `termux` (Download via FDroid) for CLI usage

**The script requires sudo and isn’t Windows compatible.**

```shell
curl https://cli-assets.heroku.com/install.sh | sh
```

**Install with Ubuntu / Debian apt-get**

```shell
curl https://cli-assets.heroku.com/install-ubuntu.sh | sh
```

**Install via `npm` (Not Recommanded)**

```shell
npm install -g heroku
```

**Official Heroku Install Guide :** [Check Here](https://devcenter.heroku.com/articles/heroku-cli#install-the-heroku-cli)

---

**Step 3 :** Login into Heroku and Log In CLI via Browser 

_With Browser_

```shell
heroku login
```

**OR**

_Without Browser_

```shell
heroku login -i
```

- Put `Heroku Email` : Heroku Email `email@example.com`

- Put `Heroku Password` : Heroku API Key. Get from [Here](https://dashboard.heroku.com/account)

---

**Step 4 :** Create Heroku App and specify stack and region with App Name

```shell
heroku create --region us --stack container APP_NAME
```

**To Be Noted**: Copy the `BASE_URL` after the App is Created and Put the Value in `BASE_URL` when editing `config.env`

**Notes:**
- `--region us` for United States Server.

- `--region eu` for Europe Server.

- `APP_NAME` should be replaced with your unique app name _(Optional)_. If not given it generates a random name.

- `--stack container` for setting stack to container for Dockerfile.

- `--buildpack heroku/python` for using build slug for repo deploy and build.

---

**Step 5 :** Now set all the Required Variables and Files into this Branch MAIN Repo like config.env, accounts.zip, token.pickle, All Private Files(optional)- 

  > Only config.env Mabdatory with Only Mandatory Vars Only, After that Put all Private Files or Vars via Bot Settings `/bs`

**To Edit Inside CLI (nano Editor):** _(Termux Users)_

```shell
nano config.env
```

- **Sample config.env** _(Copy these and Paste in Editor and Fill Up)_
  ```
  BOT_TOKEN = ""
  TELEGRAM_API = ""
  TELEGRAM_HASH = ""
  OWNER_ID = ""
  DATABASE_URL = ""
  BASE_URL = ""
  SET_COMMANDS = "True"
  UPSTREAM_REPO = "https://github.com/Tamilupdates/KPSML-X"
  UPSTREAM_BRANCH = "hk_kpsmlx"
  ```
- After Setup Exit from Editor via `CTRL + X`, followed via `y` and `Enter`...

**Helpful Commands:**

- **Exit from nano** : `CTRL + X`
- **Save File** : `CTRL + S`
- **Check Help** : `CTRL + G`
- **Undo Changes** : `ALT + U`
- ^ means CTRL _(Termux Users)_

---

**Step 6 :** Set Local git remote for Heroku. Give All Commands One by One.

```shell
git add . -f
git commit -m "HK Setup"
heroku git:remote -a APP_NAME
```

---

**Step 7 :** Now push to Heroku via git forcefully to build.

```shell
git push heroku main -f
```

**Heroku Logs:** When checking Logs, Use this will give Complete Logs.

```shell
heroku logs -a APP_NAME
```

- Add arg `-t` for Live Stream Logs and Use `CTRL + C` to Exit from it.

---

**All Heroku CLI Commands :** [Click Here](https://devcenter.heroku.com/articles/heroku-cli-commands#heroku-config-set)

---

# ***Variables Description:***

- `UPSTREAM_REPO`: GitHub repository URL, if your repo is private add `https://username:{githubtoken}@github.com/{username}/{reponame}`. `Str`

- Any change in docker you need to deploy/build again with updated repo to take effect. 
              - **No Need to delete .gitignore file or any File**

- `UPSTREAM_BRANCH`: Upstream branch for update. Default is `hk_kpsmlx`. `Str`

- `BOT_TOKEN`: Telegram Bot Token that you got from [BotFather](https://t.me/BotFather). `Str`

- `OWNER_ID`: Telegram User ID (not username) of the Owner of the bot. `Int`

- `TELEGRAM_API`: This is to authenticate your Telegram account for downloading Telegram files. You can get this from <https://my.telegram.org>. `Int`

- `TELEGRAM_HASH`: This is to authenticate your Telegram account for downloading Telegram files. You can get this from <https://my.telegram.org>. `Str`

- `BASE_URL`: Valid BASE URL where the bot is deployed to use torrent web files selection. Format of URL should be `https://app-name-random_code.herokuapp.com/`, where `app-name` is the name of your heroku app Paste the URL got when the App was Made. `Str`

- `TORRENT_TIMEOUT`: Timeout of dead torrents downloading with qBittorrent and Aria2c in seconds. `Int`
  > Must Add else Bot Crashes! Set to 0 even not Needed

- `DATABASE_URL`: Database URL of MongoDb to store all your files and Vars. Adding this will be Helpful. `Str`

---

## ***Branch Specifications:***

- All files to be Uploaded in `main` Branch and set Upstream as `hk_kpsmlx` Branch
</details>