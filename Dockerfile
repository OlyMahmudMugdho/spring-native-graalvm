# Stage 1: Build
FROM alpine AS build

# Install required libraries for the build
RUN apk add --no-cache libc6-compat

# Copy the binary into the container
COPY native-explore /native-explore

# Make the binary executable
RUN chmod +x /native-explore

# Stage 2: Final Runtime
FROM alpine:latest

# Install runtime dependencies (if needed)
RUN apk add --no-cache libc6-compat

# Copy the executable from the build stage
COPY --from=build /native-explore /native-explore

# Expose the application port
EXPOSE 8080

# Set the binary as the entry point
ENTRYPOINT ["/native-explore"]
