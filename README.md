# User Service

User Service is responsible for managing user data. It handles user registration, authentication, and profile management, ensuring a seamless and secure experience for customers.

## Features

- User Registration: Allows new customers to create an account with their personal details. 
- User Verification: Supports email or phone verification to confirm user identity.
- Authentication: Secure login and session management for returning users.
- Role Management: Assign roles (e.g., admin, customer) and control access to resources.
- Profile Management: Users can update their personal information and preferences. 
- Persistent Storage: Uses PostgreSQL to store users, roles, sessions, and verification tokens reliably.
- API Endpoints: Exposes RESTful API endpoints for integration with other services.


## API Endpoints
- `POST /users` - Registers a new user. Accepts email, password, and name.
- `POST /auth/login` – Handles user login. Returns access and refresh tokens in cookies.
- `POST /auth/verify` – Verifies a user with a token sent via email/phone.
- `POST /auth/logout` – Logs the user out by invalidating access and refresh tokens.
- `POST /auth/refresh-token` – Refreshes the access token using a valid refresh token. Handles token rotation.
- `GET /users/{id}` – Retrieves user information by ID.
- `PUT /users/{id}` – Updates user profile information (name, email, etc.).
- `GET /roles` – Retrieves a list of all roles.
- `POST /roles` – Creates a new role.
- `POST /users/{id}/roles` – Assigns a role to a user.
- `DELETE /users/{id}/roles/{role_id}`  – Removes a role from a user.


## Architecture

### Project Structure
```
user-service/
├── cmd/
│   └── user-service/        # Application entry point
├── pkg/
│   └── api/user-service/    # API handlers and business logic
├── internal/                # Internal packages not exposed outside the service
│   ├── auth/                # Authentication & verification logic
│   ├── user/                # User management logic
│   └── role/                # Role management logic
├── libs/
│   └── pgutils/             # PostgreSQL helper functions
├── logger/                  # Centralized logging
├── migrations/              # Database schema migrations
├── configs/                 # Configuration files (env, YAML, etc.)
├── Dockerfile               # Docker image definition
├── docker-compose.yml       # Local development environment setup
├── Makefile                 # Common build/run tasks
└── README.md                # Project documentation
```

### Database
- **Users** Table – Stores user credentials, profile info, and verification status.
- **Roles** Table – Stores role definitions.
- **UserRoles** Table – Maps users to roles for access control.
- **VerificationTokens** Table – Stores temporary tokens for verifying users’ email/phone.


### Configuration

The User Service can be configured using environment variables or configuration files located in the ./config directory.
The main configuration file is config/values.yaml.

Before running the service, create these files in the ./config directory:

values.yaml — see values_example.yaml for reference.

#### Example `./config/values.yaml` :

```
# PostgreSQL database
database:
  name: ""                  # Database name
  user: ""                  # Database user
  password: ""              # Database password
  host: ""                  # Database host
  port: ""                  # Database port
  ssl_mode: ""              # SSL mode (disable, require, etc.)
  max_cons:                 # Maximum connections in pool
  min_cons:                 # Minimum connections in pool
  max_con_lifetime: ""      # Maximum connection lifetime

# gRPC server
grpc:
  port: ""                  # gRPC server port
  network: ""               # Network type (tcp, unix, etc.)

# HTTP server
http:
  port: ""                  # HTTP server port
  host: ""                  # HTTP server host
  gracefulTimeout: ""       # Graceful shutdown timeout (e.g., 5s)

# Verification token
token:
  exp: ""                   # Email verification token expiration (e.g., 1h)
```

## Getting Started

### Prerequisites

- Go 1.21+
- Docker & Docker Compose
- PostgreSQL 15+


### Installation

1. **Clone the repository**
   ```bash
    git clone https://github.com/go-sso-example/user-service.git
    cd user-service
   ```

2. **Configure the service using environment variables or the config files in `/config`**
3. Install Buf:
    ```bash
   brew install bufbuild/buf/buf       # macOS
   # or for Linux:
    # curl -sSL https://github.com/bufbuild/buf/releases/download/v1.30.0/buf-Linux-x86_64 -o /usr/local/bin/buf && chmod +x /usr/local/bin/buf
    ```

4. Generate Go code from Protocol Buffers
   ```bash
   make proto-gen
    ```
   
5. Start the services
    ```bash
   docker-compose up -d
    ```