PROJECT_NAME="mits_ndk_lib"
UDL_PATH="src/mits_ndk_lib.udl"
ANDROID_PROJECT_MAIN_PATH="/Users/ysh/AndroidStudioProjects/MitsUltrasound/app/src/main"

echo "> 🔥 Build many Architecture 🔥"
cargo build --lib \
    --target x86_64-linux-android \
    --target i686-linux-android \
    --target armv7-linux-androideabi \
    --target aarch64-linux-android\

echo "> Save ffi format to jniLibs 💽"
mkdir -p jniLibs/arm64-v8a/ && \
  cp target/aarch64-linux-android/debug/lib${PROJECT_NAME}.so jniLibs/arm64-v8a/libuniffi_${PROJECT_NAME}.so && \
  mkdir -p jniLibs/armeabi-v7a/ && \
    cp target/armv7-linux-androideabi/debug/lib${PROJECT_NAME}.so jniLibs/armeabi-v7a/libuniffi_${PROJECT_NAME}.so && \
  mkdir -p jniLibs/x86/ && \
    cp target/i686-linux-android/debug/lib${PROJECT_NAME}.so jniLibs/x86/libuniffi_${PROJECT_NAME}.so && \
  mkdir -p jniLibs/x86_64/ && \
    cp target/x86_64-linux-android/debug/lib${PROJECT_NAME}.so jniLibs/x86_64/libuniffi_${PROJECT_NAME}.so

echo "> Running uniffi-bindgen transferring to Kotlin.. 💤"
cargo run --features=uniffi/cli \
    --bin uniffi-bindgen \
    generate ${UDL_PATH} \
    --language kotlin \
    --out-dir ./

echo "> complete make jniLibs, uniffi.mits_ndk_lib ✅"

cp -rf jniLibs ${ANDROID_PROJECT_MAIN_PATH}/
cp  -rf uniffi ${ANDROID_PROJECT_MAIN_PATH}/java/

echo "> Successfully injected the source into the Android project ✅"
