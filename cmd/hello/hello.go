package hello

import "fmt"

func Hello(msg string) (string, error) {
	fmt.Println("Hello " + msg)
	return msg, nil
}

