# Apotheca

**A curated collection of zero-dependency C libraries and tools, each hand-forged from first principles, collectively representing what software engineering looks like when you refuse to compromise.**

## What Is This?

Apotheca is a monorepo containing interconnected projects that share a single, radical premise: you don't need anyone else's code. Not their HTTP client. Not their JSON parser. Not their TLS stack. Not their build system. Not even their linter.

Every line of code in every submodule was written from scratch. There are no vendored dependencies. There are no submodule dependencies on external projects. There is no `node_modules`. There is no `requirements.txt`. There is no `go.sum`. There is a C compiler, a POSIX environment, and the unflinching conviction that this is all you should ever need.

## The Components

### ison — JSON Without The Baggage

A complete JSON library in one source file and one header. Parses, navigates, constructs, validates, and iterates JSONL — all in 871 lines of self-contained C99 that allocates nothing proportional to document size. The dot-path navigator extracts arbitrarily nested values by scanning the source string directly, which means you can query a fifty-megabyte JSON document with the memory footprint of a `printf`. Other JSON libraries parse your document into a tree and hand you a pointer. ison hands you the answer.

### crispus — HTTPS From The Ground Up

A full TLS 1.2 HTTPS client with every cryptographic primitive implemented internally. SHA-256. HMAC. AES-128-GCM. ECDHE over P-256 with custom bignum arithmetic. RSA signature verification. X.509 certificate parsing and chain validation. All of it — nearly 3,700 lines of readable, auditable C that depends on nothing but the standard library and POSIX sockets. Other projects depend on OpenSSL and hope for the best. crispus depends on mathematics and the unwavering belief that if you understand the RFC, you can implement the RFC.

Includes a fully parallel multi-handle interface built on `fork()` and `pipe()` — pure POSIX concurrency with no threads, no event loops, no complexity you didn't ask for.

### face — The Build System You Can Actually Read

A drop-in replacement for `make`, written in a single C source file of just over a thousand lines. Supports variables, pattern rules, substitution references, parallel builds, `.PHONY` targets, and every feature you actually use in a Makefile — without the archaeological baggage of a tool that predates the internet. Compiles in under a second. Builds everything in this repository. Has never once asked you to install autotools.

### ddiff — The Diff Tool That Understands Refactoring

The most common refactoring pattern in software — extracting code into new files — is the one pattern that every existing diff tool catastrophically misrepresents. `git diff` shows the old file as entirely deleted and every new file as entirely created, burying the actual changes under hundreds of lines of noise that represent nothing more than code moving from one place to another.

ddiff solves this completely. It reads a unified diff, detects block translations between files using histogram-based distance analysis, and separates moved code from genuinely new or deleted code. The output tells you exactly what happened: which blocks moved where, which lines within those blocks actually changed, and what's truly new or truly gone.

Includes `dpatch`, a companion tool that reconstructs the new file states from old files and a ddiff — achieving full round-trip invertibility. You can go forward and backward through a refactoring with perfect fidelity.

### insinulint — 13 Rules, Zero Dependencies, Total Clarity

A C linter that does exactly what you tell it to do and nothing else. Thirteen carefully chosen lint rules covering indentation, brace style, operator spacing, line length, and formatting consistency — all implemented in approximately 1,700 lines of C99 that compiles in under a second and runs faster than your previous linter installs. Distinguishes function definitions from control structures for brace enforcement. Handles continuation alignment inside parenthesized expressions. Supports both K&R and Allman styles. Fully configurable via a JSON specification file.

### munda — Autonomous Agents On A Toroidal Grid

A terminal-based simulation where autonomous entities — cats, bears, daleks, crows — inhabit a toroidal grid and make decisions through LLM inference calls. Features multi-provider support (OpenAI, Anthropic, xAI), batched async inference, emergent multi-turn dialogue between agents, a player-controlled deity, and a custom encrypted TCP protocol for networked multiplayer — complete with ECDHE P-256 key exchange and AES-128-GCM encryption, all implemented internally.

Built entirely on crispus for HTTPS and ison for JSON, because when you've already written those from scratch, you would be a fool not to use them.

### phantasma — A Window, A Renderer, And Two Video Encoders Walk Into A Static Library

A complete graphics library that gives you windowing, hardware-accelerated rendering, keyboard and mouse input, animated GIF encoding, and H.264 MP4 video encoding — all compiled into a single static library with absolutely zero external dependencies. Phantasma replaces SDL2, libx264, giflib, and the parts of ffmpeg you actually use, in one shot. No package managers. No dynamic linking. No configuration scripts. No development headers to hunt down.

The windowing layer is native on both platforms — Cocoa with Core Graphics on macOS, Xlib on Linux — with identical behavior and an API so minimal the entire public interface fits in a single header. Create a window, push ARGB8888 pixel buffers, present the frame. The event model is poll-based, clean, and built for real-time interactive applications.

The GIF encoder implements median-cut color quantization to 128 colors, Bayer 8×8 ordered dithering, and full LZW compression from scratch. The MP4 encoder generates valid H.264 Baseline with proper NAL unit packaging, correct SPS/PPS generation, and a complete ISO base media file container — every frame is an IDR, so you can seek to any point instantly. Both encoders take raw ARGB frames in and produce broadcast-quality output. Three function calls each.

### sqrt — Isometric Embedding Of The Flat Torus

A mathematical visualization suite that computes and renders the Nash-Kuiper C1 isometric embedding of the flat torus into three-dimensional Euclidean space — the celebrated Hévéa torus. Multiple embedding methods (corrugated, iterated, spiral, normal), Phong illumination with Fresnel effects, an interactive SDL2 viewer with real-time rotation and recording, and a procedural starfield generator that populates toroidal skies with physically-typed stellar objects. Over 3,300 lines of C that turn differential geometry into pixels.

## Building

```bash
face para
face omnia
```

## License

Free. Public domain. Use however you like.
