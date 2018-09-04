package hello_test

import (
	. "github.com/onsi/ginkgo"
	. "github.com/onsi/gomega"
	"github.com/xinzweb/make-in-docker/cmd/hello"
)

var _ = Describe("hello", func() {
	It("says hello", func() {
		msg, err := hello.Hello("there")
		Expect(msg).To(Equal("Hi there"))
		Expect(err).ToNot(HaveOccurred())
	})
})
