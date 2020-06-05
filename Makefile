USER_NAME=ppavlov39
.DEFAULT_GOAL := help

define HELP_TEXT
Use:
build_ui
build_post
build_comment
build_prometheus
build_alertmanager
build_bb_exporter
build_mongo_exporter
build_all - for build all images

push_ui
push_post
push_comment
push_prometheus
push_bb_exporter
push_mongo_exporter
push_all - for build all images
endef

export HELP_TEXT
export USER_NAME

help:
	@echo "$$HELP_TEXT"
build_ui:
	bash -c 'export USER_NAME=ppavlov39 && cd ./src/ui && bash ./docker_build.sh'
build_post:
	bash -c 'export USER_NAME=ppavlov39 && cd ./src/post-py && bash ./docker_build.sh'
build_comment:
	bash -c 'export USER_NAME=ppavlov39 && cd ./src/comment && bash ./docker_build.sh'
build_prometheus:
	bash -c "cd ./monitoring/prometheus/ && docker build -t $$USER_NAME/prometheus ."
build_alertmanager:
	bash -c "cd ./monitoring/alertmanager/ && docker build -t $$USER_NAME/alertmanager ."
build_mongo_exporter:
	bash -c "cd /tmp/ && git clone https://github.com/percona/mongodb_exporter.git && cd /tmp/mongodb_exporter && docker build -t $$USER_NAME/mongodb-exporter . && cd / && rm -rf /tmp/mongodb_exporter"
build_bb_exporter:
	bash -c "cd ./monitoring/prometheus/ && docker build -t $$USER_NAME/blackbox-exporter -f ./Dockerfile_blackbox ."
build_fluentd:
	bash -c "cd ./logging/fluentd/ && docker build -t $$USER_NAME/fluentd ."

push_ui:
	docker push $$USER_NAME/ui
push_post:
	docker push $$USER_NAME/post
push_comment:
	docker push $$USER_NAME/comment
push_mongo_exporter:
	docker push $$USER_NAME/mongodb-exporter
push_bb_exporter:
	docker push $$USER_NAME/blackbox-exporter
push_prometheus:
	docker push $$USER_NAME/prometheus
push_alertmanager:
	docker push $$USER_NAME/alertmanager
push_fluentd:
	docker push $$USER_NAME/fluentd

push_all: push_ui push_post push_comment push_bb_exporter push_prometheus push_mongo_exporter push_alertmanager push_fluentd
build_all: build_ui build_post build_comment build_prometheus build_bb_exporter build_mongo_exporter build_alertmanager build_fluentd
