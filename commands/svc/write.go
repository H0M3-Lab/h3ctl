// SPDX-License-Identifier: AGPL-3.0-or-later

package svc

import (
	"errors"

	"github.com/spf13/cobra"
)

func newWriteCmd(cluster *string, vm *string, output *string) *cobra.Command {
	return &cobra.Command{
		Use:   "write",
		Short: "Write the service file for a VM to disk without loading it",
		RunE: func(_ *cobra.Command, _ []string) error {
			return errors.New("not yet implemented")
		},
	}
}
