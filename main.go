package main

import (
    "net/http"
    "fmt"
    "os"
)

func main() {
    PORT := os.Getenv("PORT")
    if len(PORT) == 0 {
        PORT = "8000"
    }
    fmt.Printf("Listening on %s\n", PORT)

    answer := http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
        fmt.Fprintf(w, "\nHealthy!")
    })
    http.ListenAndServe(":" + PORT, answer)
}
