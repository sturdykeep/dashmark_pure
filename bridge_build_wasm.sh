rm -rf /home/fox/Development/Projects/dashmark_pure/web/pkg
RUSTFLAGS="-O -C target-feature=+simd128" \
    wasm-pack build -t no-modules -d /home/fox/Development/Projects/dashmark_pure/web/pkg --no-typescript --out-name native --dev native -- -Z build-std=std,panic_abort