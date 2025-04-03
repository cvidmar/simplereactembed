# Path to frontend source and build output
FRONTEND_DIR := web
DIST_DIR := $(FRONTEND_DIR)/dist

# Go output binary
BINARY := simplereactembed 

# Default target: build React and Go binary
all: build

# Build React app
build-frontend:
	cd $(FRONTEND_DIR) && npm install && npm run build

# Build Go binary (after frontend)
build: build-frontend
	go build -o $(BINARY) main.go

# Clean build artifacts
clean:
	rm -rf $(DIST_DIR) $(BINARY)

# Run the app
run: build
	./$(BINARY)

# Run development server (React only)
dev:
	cd $(FRONTEND_DIR) && npm run dev