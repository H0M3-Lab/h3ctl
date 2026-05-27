// SPDX-License-Identifier: AGPL-3.0-or-later

package global

import (
	"errors"

	"github.com/spf13/cobra"
)

func NewUseCmd() *cobra.Command {
	return &cobra.Command{
		Use:   "use <cluster-name>",
		Short: "Set the active cluster context",
		Args:  cobra.ExactArgs(1),
		RunE: func(_ *cobra.Command, _ []string) error {
			return errors.New("not yet implemented")
		},
	}
}
