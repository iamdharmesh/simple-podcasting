<?php
/**
 * Podcast Transcript markup
 *
 * @package tenup_podcasting
 *
 * @var array    $attributes Block attributes.
 * @var string   $content    Block content.
 * @var WP_Block $block      Block instance.
 * @var array    $context    Block context.
 */

use function tenup_podcasting\transcripts\podcasting_wrap_unwrapped_text_in_paragraph;
use function tenup_podcasting\transcripts\get_transcript_link_from_post;

if ( 'none' !== $attributes['display'] ) : ?>
<div <?php echo get_block_wrapper_attributes(); // phpcs:ignore ?>>
	<?php
	global $post;
	switch ( $attributes['display'] ) {
		case 'post':
			echo wp_kses_post(
				podcasting_wrap_unwrapped_text_in_paragraph(
					get_post_meta( get_the_ID(), 'podcast_transcript', true )
				)
			);
			break;
		case 'link':
			printf(
				'<p><a href="%s">%s</a></p>',
				esc_url( get_transcript_link_from_post( $post ) ),
				esc_html( $attributes['linkText'] )
			);
			break;
	}
	?>
</div>
<?php endif; ?>
