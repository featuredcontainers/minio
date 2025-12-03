FROM golang:1.24
RUN CGO_ENABLED=0 go install -v github.com/minio/minio@RELEASE.2025-10-15T17-29-55Z

FROM gcr.io/distroless/static-debian13
COPY --from=build /go/bin/minio /
CMD ["/minio"]
