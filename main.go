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

    answer := http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
        fmt.Fprintf(w, "Healthy!")
    })
    http.ListenAndServe(":" + PORT, answer)
}
