# Ambient Comfort
App for visualizing ambient data.

![Application screenshot](https://github.com/hermanzdosilovic/ambient-comfort/blob/master/.github/screenshot1.png)

## How It Works?
Your device should frequently send ambient data to `/logs` route and then you can visualize that data on `/`.

## Setup & Configuration

### Fast Setup
1. Download [docker-compose.yml](https://github.com/hermanzdosilovic/ambient-comfort/blob/master/docker-compose.yml)
2. Download [ambient.conf](https://github.com/hermanzdosilovic/ambient-comfort/blob/master/ambient.conf) file and fill it up.
  - `SECRET_KEY_BASES` is used for verifying the integrity of signed cookies. Make sure it is at least 30 characters and all random
	- `API_KEY` is secret key used when sending data to server
	- `USERNAME` and `PASSWORD` are used when you want to see and visualize all your data.
3. Run `mkdir srv && touch srv/production.sqlite3`
4. Run `docker-compose up -d`
5. Open `http://<YOUR IP>:3000` in your browser

## API
### `POST /logs`
#### Request
##### Headers
```json
Content-Type: application/json
X-Auth-Token: <YOUR AUTH TOKEN>
```

##### Body
```json
{
    "created_at": "2017-06-05 03:30:46"
    "temperature": 32,
    "moisture": 88.62415,
    "pressure": 991.99443,
    "brightness": 5.22814,
    "noise": 5.94466
}
```

#### Response `202`
##### Headers
```json
Content-Type: application/json
```

##### Body
```json
{
  "id": 1216,
  "created_at": "2017-06-05T01:30:46.000Z",
  "temperature": "32.0",
  "moisture": "88.62415",
  "pressure": "991.99443",
  "brightness": "5.22814",
  "noise": "5.94466"
}
```

#### Response `422`
##### Headers
```json
Content-Type: application/json
```

##### Body
```json
{
  "created_at": [
    "can't be blank"
  ]
}
```