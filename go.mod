module github.com/go-sso-example/user-service

go 1.25.1

require (
	github.com/Masterminds/squirrel v1.5.4
	github.com/georgysavva/scany/v2 v2.1.4
	github.com/go-sso-example/user-service/pkg/api/user-service v0.0.0-00010101000000-000000000000
	github.com/grpc-ecosystem/grpc-gateway v1.16.0
	github.com/jackc/pgx/v5 v5.7.6
	github.com/spf13/viper v1.21.0
	go.uber.org/zap v1.27.0
	golang.org/x/crypto v0.42.0
	google.golang.org/grpc v1.76.0
	google.golang.org/protobuf v1.36.10
)

require (
	github.com/fsnotify/fsnotify v1.9.0 // indirect
	github.com/go-viper/mapstructure/v2 v2.4.0 // indirect
	github.com/golang/protobuf v1.5.4 // indirect
	github.com/grpc-ecosystem/grpc-gateway/v2 v2.27.3 // indirect
	github.com/jackc/pgpassfile v1.0.0 // indirect
	github.com/jackc/pgservicefile v0.0.0-20240606120523-5a60cdf6a761 // indirect
	github.com/jackc/puddle/v2 v2.2.2 // indirect
	github.com/lann/builder v0.0.0-20180802200727-47ae307949d0 // indirect
	github.com/lann/ps v0.0.0-20150810152359-62de8c46ede0 // indirect
	github.com/pelletier/go-toml/v2 v2.2.4 // indirect
	github.com/sagikazarmark/locafero v0.12.0 // indirect
	github.com/spf13/afero v1.15.0 // indirect
	github.com/spf13/cast v1.10.0 // indirect
	github.com/spf13/pflag v1.0.10 // indirect
	github.com/subosito/gotenv v1.6.0 // indirect
	go.uber.org/multierr v1.11.0 // indirect
	go.yaml.in/yaml/v3 v3.0.4 // indirect
	golang.org/x/net v0.44.0 // indirect
	golang.org/x/sync v0.17.0 // indirect
	golang.org/x/sys v0.36.0 // indirect
	golang.org/x/text v0.29.0 // indirect
	google.golang.org/genproto v0.0.0-20251006185510-65f7160b3a87 // indirect
	google.golang.org/genproto/googleapis/api v0.0.0-20251006185510-65f7160b3a87 // indirect
	google.golang.org/genproto/googleapis/rpc v0.0.0-20251006185510-65f7160b3a87 // indirect
)

replace github.com/go-sso-example/user-service/pkg/api/user-service => ./pkg/api/user-service
