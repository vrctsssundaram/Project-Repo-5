# Test procedure

Run `make test` and confirm `PASS`. The regression drives five contending sources to output 2, holds its ready low, verifies output stability and then checks round-robin grant order.

Further tests required: all destination combinations, simultaneous independent destinations, sustained traffic, reset during contention and formal no-duplication/no-loss properties.
