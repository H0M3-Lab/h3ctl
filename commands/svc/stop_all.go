// SPDX-License-Identifier: AGPL-3.0-or-later

package svc

import (
	"errors"

	"github.com/spf13/cobra"
)

func newStopAllCmd(cluster *string, vm *string, output *string) *cobra.Command {
	return &cobra.Command{
		Use:   "stop-all",
		Short: "Emergency unload of all h3ctl-managed services on the host",
		RunE: func(_ *cobra.Command, _ []string) error {
			return errors.New("not yet implemented")
		},
	}
}
