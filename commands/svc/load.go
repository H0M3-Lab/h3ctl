// SPDX-License-Identifier: AGPL-3.0-or-later

package svc

import (
	"errors"

	"github.com/spf13/cobra"
)

func newLoadCmd(cluster *string, vm *string, output *string) *cobra.Command {
	return &cobra.Command{
		Use:   "load",
		Short: "Load the service file for a VM into the host service manager",
		RunE: func(_ *cobra.Command, _ []string) error {
			return errors.New("not yet implemented")
		},
	}
}
