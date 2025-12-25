# ffmpeg-upscale

OBS로 녹화한 1080p 영상을  
**ffmpeg + AMD AMF(GPU)**로 1440p 업스케일해서  
유튜브 업로드용 파일을 만드는 배치 스크립트야.

---

## 1. ffmpeg 설치 (Windows)

1. ffmpeg 다운로드  
   https://www.gyan.dev/ffmpeg/builds/  
   → **essentials 또는 full build** 아무거나 OK

2. 압축 해제  
   예시:
```

C:\ffmpeg
└─ bin
└─ ffmpeg.exe

```

---

## 2. ffmpeg PATH 설정

1. **시스템 환경 변수** 열기
- Windows 검색 → `환경 변수`
- `시스템 환경 변수 편집`

2. **Path** 선택 → 편집 → 새로 만들기
```

C:\ffmpeg\bin

````

3. 확인 → CMD 새로 열기

4. 정상 확인
```bat
ffmpeg -version
````

---

## 3. 배치 파일 사용법

### 기본 사용

```bat
upscale_1440p_h264_cqp.bat input.mkv
```

또는

```bat
upscale_1440p_h264_cqp.bat "D:\OBS\record.mkv"
```

### 결과

* 같은 폴더에 파일 생성됨

```
input_1440p_H264_CQP.mp4
```

---

## 4. 배치 파일 특징

* 1080p → 1440p 업스케일 (Lanczos)
* AMD GPU 인코딩 (**h264_amf**)
* 비트레이트 고정 없음 (**CQP 방식**)
* 유튜브 업로드 최적

---

## 참고

* CPU가 많이 쓰이면 GPU 인코딩이 안 탄 거임
* 실행 로그에 `h264_amf`가 보이면 정상
