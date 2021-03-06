---
layout: "post"
title: "vi 에디터 단축키"
date: "2017-01-31 23:02"
categories : tips
tags : vi
---

# vi 편집기

vi(브이아이, /ˈviːˈaɪ/)는 Emacs와 함께 유닉스 환경에서 가장 많이 쓰이는 문서 편집기이다. 1976년 빌 조이가 초기 BSD 릴리즈에 포함될 편집기로 만들었다. vi라는 이름은 한 줄씩 편집하는 줄단위 편집기가 아니라 한 화면을 편집하는 비주얼 에디터(visual editor)라는 뜻에서 유래했다. 간결하면서도, 강력한 기능으로 열광적인 사용자가 많다.
현재는 오리지널 vi를 사용하는 경우는 거의 없고, 일반적으로 기능을 모방하여 만들어진 클론을 사용하고 있다. 이런 클론 중 많이 쓰이는 것은 기능이 다양한 것을 장점으로 내세우며, 리눅스 배포판에 포함되는 Vim, 그리고, BSD 라이선스로 제공되며 원본 vi의 동작과 호환성으로 정평이 나 있는 nvi, 독자적인 팬층을 확보한 elvis등이 있다.

> [wiki:vi](https://ko.wikipedia.org/wiki/Vi)


## vi 실행하기

|명령어|동작|
|:--:|:--|
| vi file | file을 연다 |
| vi file1 file2 | file1과 file2를 차례로 연다 |
| <span style="color:red">view file</span> | file을 읽기모드로 연다 |
| vi -R file | file을 읽기모드로 연다 |
| vi +n file | file을 열어 n행에 위치한다 |
| vi -r file | 손상된 파일 회복 |

## 입력모드 전환 명령어

|명령어|동작|
|:--:|:--|
| i | 커서있는데서 입력모드 전환 |
| I | 커서 왼쪽, 행의 처음에 문자 삽입 |
| a | 커서 있는 줄 끝에서 입력모드 전환 |
| A | 커서 오른쪽, 행의 끝에 문자 삽입 |
| o | 커서 있는 줄 아래에 빈 줄 삽입 |
| O | 커서 있는 줄 위에 빈 줄 삽입 |
| R | 덮어쓰기 모드로 전환 |

## 커서의 이동

|명령어|동작|
|:--:|:--|
|^, 0 | 줄의 처음으로 이동 |
| $ | 줄의 끝으로 이동 |
| H | 화면 맨 위로 이동 |
| M | 화면의 중간으로 이동 |
| L | 화면 맨 아래로 이동 |
| w | 다음 단어 끝으러 커서 이동 |
| e | 다음 단어 앞으로 커서 이동 |
| shift + ↑| 한페이지 앞으로 이동 |
| shift + ↓| 한페이지 뒤로 이동 |
| 3G | 현재 커서 위치한 행에서 3번째 행으로 이동 |
| <span style="color:red">Ctrl + i</span> | 한 화면 위로 이동 |
| <span style="color:red">Ctrl + b</span> | 한 화면 아래로 이동 |
| Ctrl + d | 반 화면 위로 이동 |
| Ctrl + u | 반 화면 아래로 이동 |
| Ctrl + e | 한 줄씩 위로 이동 |
| Ctrl + y | 한 줄씩 아래로 이동 |

## 삭제

|명령어|동작|
|:--:|:--|
| x | 한 문자 삭제 |
| <span style="color:red">dd</span> | 한 줄 삭제 |
| 5dd | 커서가 있는 라인부터 5 라인 삭제 |
| D | 한 줄 내에서 커서있는 뒤 모두 삭제 |
| u | 바로 전에 수행한 명령을 취소 |
| :5,10 o | 5~10번째 행 삭제 |

## 복사와 붙여넣기

|명령어|동작|
|:--:|:--|
| <span style="color:red">yy</span> | 현재 줄을 버퍼로 복사 |
| <span style="color:red">p</span> | 버퍼에 있는 내용을 커서 뒤에 삽입 |
| P | 버퍼에 있는 내용을 커서 앞에 삽입 |
| d | 현재 커서가 위치에 있는 단어 복사 |
| 3yy | 현재 행을 기준으로 3번째 행까지 n행 복사 |

## 문자열 찾기

|명령어|동작|
|:--:|:--|
| <span style="color:red">/name</span> | name 문자열 찾기 |
| <span style="color:red">n</span> | 다음 name 으로 이동 |
| N | n과 같으며 역방향으로 이동 |

## 문자열 대체

|명령어|동작|
|:--:|:--|
| :s/str/rep | 현재 행의 str을 rep로 대체 |
| :%s/str/rep/g | 파일 전체의 str을 rep로 전부 대체 |

## 파일 저장 및 불러오기

|명령어|동작|
|:--:|:--|
| :w | 지정된 파일에 저장 |
| :wq | 지정된 파일에 저장하고 vi를 종료 |
| :w php.ini | php.ini 파일에 저장 |
| :q | 저장하지 않고 종료 |
| :q! | 저장하지 않고 강제 종료 |
| :wq php.ini | php.ini 파일에 저장하고 vi를 종료 |
| :r php.ini | php.ini의 내용을 현재 커서가 있는데로 불러온다 |

## 기타

|명령어|동작|
|:--:|:--|
| :set nu | 행 번호 보여주기 |
| :set nonu | 행번호 보여주기 취소 |
| . | 바로 전에 실행한 명령어 재실행 |
| Ctrl + I | 불필요한 화면 정리후 다시 표시 |




<br>
<br>

> [참고:개발이하고싶어요](http://hyeonstorage.tistory.com/274)
