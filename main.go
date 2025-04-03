package main

import (
	"embed"
	"io/fs"
	"log"
	"net/http"
)

//go:embed web/dist/*
var content embed.FS

func main() {
	dist, err := fs.Sub(content, "web/dist")
	if err != nil {
		log.Fatal(err)
	}

	// Serve embedded files
	fileServer := http.FileServer(http.FS(dist))

	http.Handle("/", fileServer)

	log.Println("Server started at http://localhost:3333")
	err = http.ListenAndServe(":3333", nil)
	if err != nil {
		log.Fatal(err)
	}
}
