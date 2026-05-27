// SPDX-License-Identifier: AGPL-3.0-or-later

package svc

import (
	"errors"

	"github.com/spf13/cobra"
)

func newUnloadCmd(cluster *string, vm *string, output *string) *cobra.Command {
	return &cobra.Command{
		Use:   "unload",
		Short: "Unload the service for a VM from the host service manager",
		RunE: func(_ *cobra.Command, _ []string) error {
			return errors.New("not yet implemented")
		},
	}
}
