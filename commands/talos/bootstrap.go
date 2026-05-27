// SPDX-License-Identifier: AGPL-3.0-or-later

package talos

import (
	"errors"

	"github.com/spf13/cobra"
)

func newBootstrapCmd(cluster *string, vm *string, output *string) *cobra.Command {
	return &cobra.Command{
		Use:   "bootstrap",
		Short: "Bootstrap etcd on the first controlplane VM",
		RunE: func(_ *cobra.Command, _ []string) error {
			return errors.New("not yet implemented")
		},
	}
}
