#include <WiFi.h>
#include <ArduinoJson.h>
#include <ArduinoWebsockets.h>

const char* ssid = "Wokwi-GUEST";
const char* password = ""; 
const char* websockets_server_host = "host.wokwi.internal"; 
const uint16_t websockets_server_port = 3000; 

using namespace websockets;

WebsocketsClient client;

// LED pins
const int ledPins[5] = {12, 13, 14, 15};


void onMessageCallback(WebsocketsMessage message) {
    Serial.println("Received message: " + message.data());

    StaticJsonDocument<200> doc;
    DeserializationError error = deserializeJson(doc, message.data());

    if (error) {
        Serial.println("Failed to parse JSON");
        return;
    }

    int number = doc["number"];
    int status = doc["status"];

    if (number >= 0 && number < 5) {
        digitalWrite(ledPins[number], status ? HIGH : LOW);
        Serial.printf("LED %d turned %s\n", number, status ? "ON" : "OFF");
    } else {
        Serial.println("Invalid LED number");
    }
}

void setup() {
    Serial.begin(115200);


    for (int i = 0; i < 5; i++) {
        pinMode(ledPins[i], OUTPUT);
        digitalWrite(ledPins[i], LOW);
    }

    WiFi.begin(ssid, password);
    for (int i = 0; i < 10 && WiFi.status() != WL_CONNECTED; i++) {
        Serial.print(".");
        delay(1000);
    }
    Serial.println("\nConnected to WiFi");

    client.onMessage(onMessageCallback);

    client.connect(websockets_server_host, websockets_server_port, "/ws");
}

void loop() {
    client.poll();
}