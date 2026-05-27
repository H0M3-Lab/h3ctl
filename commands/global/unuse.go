// SPDX-License-Identifier: AGPL-3.0-or-later

package global

import (
	"errors"

	"github.com/spf13/cobra"
)

func NewUnuseCmd() *cobra.Command {
	return &cobra.Command{
		Use:   "unuse [cluster-name]",
		Short: "Clear the active cluster context",
		Args:  cobra.MaximumNArgs(1),
		RunE: func(_ *cobra.Command, _ []string) error {
			return errors.New("not yet implemented")
		},
	}
}
