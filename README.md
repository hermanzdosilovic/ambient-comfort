# Ambient Comfort
App for visualizing ambient data.

## How It Works?
Your device should frequently send ambient data to `/logs` route and then you can visualize that data on `/`.

## Setup
...

## Configuration
...

## API
### `POST /logs`
#### Request
##### Headers
```json
Content-Type: application/json
```

##### Body
```json
{
    "created_at":"2017-06-05 03:30:46"
    "temperature":32,
    "moisture":"88.62415",
    "pressure":991.99443,
    "brightness":5.22814,
    "noise":5.94466
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