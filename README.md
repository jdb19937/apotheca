# Apotheca

**A curated collection of zero-dependency C libraries and tools, each hand-forged from first principles, collectively representing what software engineering looks like when you refuse to compromise.**

## What Is This?

Apotheca is a monorepo containing six interconnected projects that share a single, radical premise: you don't need anyone else's code. Not their HTTP client. Not their JSON parser. Not their TLS stack. Not their build system. Not even their linter.

Every line of code in every submodule was written from scratch. There are no vendored dependencies. There are no submodule dependencies on external projects. There is no `node_modules`. There is no `requirements.txt`. There is no `go.sum`. There is a C compiler, a POSIX environment, and the unflinching conviction that this is all you should ever need.

## The Components

### ison — JSON Without The Baggage

A complete JSON library in one source file and one header. Parses, navigates, constructs, validates, and iterates JSONL — all without allocating memory proportional to document size. The dot-path navigator extracts nested values by scanning the source string directly, which is either a clever optimization or a work of art depending on how you look at it.

### crispus — HTTPS From Scratch

A full TLS 1.2 HTTPS client with every cryptographic primitive implemented internally. SHA-256. HMAC. AES-128-GCM. ECDHE over P-256 with custom bignum arithmetic. RSA signature verification. X.509 certificate parsing. All in roughly three thousand lines of readable C. Other projects depend on OpenSSL and hope for the best. crispus depends on mathematics and the C standard library.

### face — Build System

A build tool. It builds things. It is written in C. It replaces make for projects that would rather their build system be small enough to audit during a coffee break.

### ddiff — Diff, But Actually Useful

A diff post-processor that detects when code has been moved between files — the single most common refactoring pattern that `git diff` has been catastrophically misrepresenting since its inception. Includes `dpatch`, a companion tool that can reconstruct new file states from old files and a ddiff, achieving full round-trip invertibility. Other diff tools show you what changed. ddiff shows you what *actually* changed.

### insinulint — The C Linter That C Deserves

Thirteen meticulously crafted lint rules for C, implemented in approximately 1700 lines of zero-dependency C99. Distinguishes function definitions from control structures for brace style enforcement. Handles continuation alignment inside parenthesized expressions. Supports both K&R and Allman styles. Configurable via JSON. Compiles in under a second. Runs faster than your previous linter installs.

### munda — Agentic Grid Simulation

A terminal-based simulation where autonomous agents — cats, bears, daleks, crows — inhabit a toroidal grid and make decisions through LLM calls. Features multi-provider support (OpenAI, Anthropic, xAI), batched inference, emergent multi-turn dialogue, and a custom encrypted TCP protocol for networked play. Built on crispus for HTTPS and ison for JSON, because when you've already written those from scratch, you might as well use them.

## Building

```bash
face para
face omnia
```

## License

Free. Public domain. Use however you like.
