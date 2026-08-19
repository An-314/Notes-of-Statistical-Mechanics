PORTAL_ROOT := ./
BUILD_DIR := builds

NOTES_SSH_HOST := notes.anzreww.top
NOTES_SSH_PORT := 8822
NOTES_SSH_USER := notes

NOTES_SSH_IDENTITY := $(HOME)/.ssh/id_ed25519

CONTAINER_NOTES_DIR := /srv/notes/Physics/Statistical-Mechanics

SSH_OPTIONS := -o BatchMode=yes \
	-o StrictHostKeyChecking=accept-new \
	-o IdentitiesOnly=yes \
	-i '$(NOTES_SSH_IDENTITY)' \
	-p '$(NOTES_SSH_PORT)'
SSH_TARGET := $(NOTES_SSH_USER)@$(NOTES_SSH_HOST)

.PHONY: ssh-test check-publish-config prepare-remote publish

ssh-test:
	@ssh $(SSH_OPTIONS) "$(SSH_TARGET)" \
	  'printf "Docker SSH 上传通道正常。\\n"'

check-publish-config:
	@test -d "$(BUILD_DIR)" || { \
	  printf '本地构建目录不存在：%s\n' "$(BUILD_DIR)" >&2; \
	  exit 1; \
	}
	@test -f "$(NOTES_SSH_IDENTITY)" || { \
	  printf 'SSH 私钥不存在：%s\n' "$(NOTES_SSH_IDENTITY)" >&2; \
	  exit 1; \
	}
	@case "$(CONTAINER_NOTES_DIR)" in \
	  /*) ;; \
	  *) printf '容器目标目录必须是绝对路径：%s\n' "$(CONTAINER_NOTES_DIR)" >&2; exit 1 ;; \
	esac
	@case "$(CONTAINER_NOTES_DIR)" in \
	  *"'"*) printf '容器目标目录不能包含单引号。\n' >&2; exit 1 ;; \
	  *) ;; \
	esac

prepare-remote: check-publish-config
	@printf '创建远端目录：%s:%s\n' "$(SSH_TARGET)" "$(CONTAINER_NOTES_DIR)"
	@ssh $(SSH_OPTIONS) "$(SSH_TARGET)" \
	  "mkdir -p -- '$(CONTAINER_NOTES_DIR)'"

publish: prepare-remote
	@printf '上传 %s/ 到 %s:%s/\n' "$(BUILD_DIR)" "$(SSH_TARGET)" "$(CONTAINER_NOTES_DIR)"
	@rsync -av --progress \
	  -e "ssh $(SSH_OPTIONS)" \
	  "$(BUILD_DIR)/" \
	  "$(SSH_TARGET):$(CONTAINER_NOTES_DIR)/"
