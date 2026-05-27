// SPDX-License-Identifier: AGPL-3.0-or-later

package vm

import (
	"errors"

	"github.com/spf13/cobra"
)

func newDeleteCmd(cluster *string, vm *string, output *string) *cobra.Command {
	return &cobra.Command{
		Use:   "delete",
		Short: "Remove disk image, service file, and IP cache for a stopped VM",
		RunE: func(_ *cobra.Command, _ []string) error {
			return errors.New("not yet implemented")
		},
	}
}
