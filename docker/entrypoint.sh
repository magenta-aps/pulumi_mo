#!/bin/bash
# SPDX-FileCopyrightText: Magenta ApS <https://magenta.dk>
# SPDX-License-Identifier: MPL-2.0

USERNAME=${FASTRAMQPI__DATABASE__USER}
PASSWORD=${FASTRAMQPI__DATABASE__PASSWORD}
HOST=${FASTRAMQPI__DATABASE__HOST}
NAME=${FASTRAMQPI__DATABASE__NAME}

pulumi login "postgres://${USERNAME}:${PASSWORD}@${HOST}:5432/${NAME}?sslmode=disable"
pulumi stack select test --create --non-interactive

pulumi config set mora_base "${FASTRAMQPI__MO_URL}"
pulumi config set mora_client_id "${FASTRAMQPI__CLIENT_ID}"
pulumi config set --secret mora_client_secret "${FASTRAMQPI__CLIENT_SECRET}"
pulumi config set mora_auth_server "${FASTRAMQPI__AUTH_SERVER}"

pulumi preview
