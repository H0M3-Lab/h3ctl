// SPDX-License-Identifier: AGPL-3.0-or-later

package vm

import (
	"errors"

	"github.com/spf13/cobra"
)

func newCreateCmd(cluster *string, vm *string, output *string) *cobra.Command {
	return &cobra.Command{
		Use:   "create",
		Short: "Allocate a disk image for the VM without booting it",
		RunE: func(_ *cobra.Command, _ []string) error {
			return errors.New("not yet implemented")
		},
	}
}
