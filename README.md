# MITS 멀티플랫폼 SDK 빌드시스템
윤상현이 다 만듭니다...


## 🖥️ What is this
-고성능 신호처리를 위한 메소드들을 멀티플랫폼 환경에 맞게 네이티브 성능으로 포팅합니다.
<br>
-엠바고 문제가 해결되기 전 까지 메소드들은 reverser로 대체합니다.
<br>

## 🕰️ 개발 기간
* 24.1.2일 - 뻐킹 지금까지

### ⚙️ 개발 환경
- `Rust 1.75.0`
- `rustup 1.26.0`
- `uniffi 0.25.3`
- **IDE** : RustRover (쓰지마십쇼 베타는 건드는거 아닙니다) RustAnalyzer 쓰세요

## 📌 주요 기능
#### 지원 빌드환경
- Kotlin
- Python
- Swift
- Wasm

#### 지원 예정 기능
- Tauri 기반 Desktop App 서비스 CI/CD 지원. 
- JNI 관련 비동기 처리 자동 빌드 환경 (코틀린이 있어서 미루는 중)

## ⚠ 개발 기간
* 메소드들 중 최후 레이어에서 Native Language Built-in 함수들을 콜백으로 써야 할 경우를 지양해야 합니다.
  <br>
* example
  '''
  #Legacy Flow
  def b():
    return 0
  def a():
    return b()

  #Refrain from designing function connectivity

  #Using SDK Method
  any_varialbe = Rusted_a()
  Rusted_b(any_varialbe)

  #Design to hand over parameters continuously
  '''
  

## Flow
![제목을-입력해주세요_-001](https://github.com/ysh8614/MITS_Rust_Multiplatform_SDK/assets/76057036/85a209e0-e6b7-4d9a-9902-923bb1b246bf)
