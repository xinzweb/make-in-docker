package hello

import "fmt"

func Hello(msg string) (string, error) {
	fullMessage := "Hello " + msg
	fmt.Println(fullMessage)
	return fullMessage, nil
}

