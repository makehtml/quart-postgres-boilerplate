#! bin/sh

. .venv/bin/activate
exec hypercorn -b 0.0.0.0:9000 manage:app --config hypercorn.yml