package hello

import "fmt"

func Hello(msg string) error {
	fmt.Println("Hello " + msg)
	return nil
}

