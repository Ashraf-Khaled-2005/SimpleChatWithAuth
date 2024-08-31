# Simple Chat App

## Overview

This Flutter application is a simple chat app that allows users to authenticate with email and password and chat with others in real-time. The app utilizes Firebase for authentication and Cloud Firestore for real-time messaging.

## Features

- **Firebase Authentication**:
  - Users can sign up and log in using their email and password.
  - Supports user registration, login, and authentication.

- **Real-Time Chat**:
  - Users can send and receive messages in real-time using Cloud Firestore.
  - Messages are stored and synchronized across devices.

- **Text Field Validation**:
  - Validates user input in text fields to ensure that messages are not empty and adhere to format requirements.

## Technical Details

- **Flutter**: The app is developed using Flutter, enabling a smooth and responsive user interface.

- **Firebase Authentication**:
  - Provides secure authentication using email and password.
  - Manages user sessions and authentication state.

- **Cloud Firestore**:
  - Real-time database used to store and retrieve chat messages.
  - Messages are updated live across all devices connected to the chat.

- **Text Field Validation**:
  - Ensures that messages are not empty before sending.
  - Provides user feedback if the input does not meet the validation criteria.

## Installation

1. Clone the repository:
   ```bash
   git clone <https://github.com/Ashraf-Khaled-2005/SimpleChatWithAuth.git>
