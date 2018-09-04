package hello

import "fmt"

func Hello(msg string) (string, error) {
	fullMessage := "Hi " + msg
	fmt.Println(fullMessage)
	return fullMessage, nil
}

