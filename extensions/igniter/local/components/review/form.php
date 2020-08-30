<?php if ($reviewable) { ?>
    <h4 class="text-center font-weight-normal">
        <?= $customerReview
            ? lang('igniter.local::default.review.text_your_review')
            : lang('igniter.local::default.review.text_write_review');
        ?>
    </h4>
    <form
        role="form"
        method="POST"
        accept-charset="utf-8"
        <?= $customerReview ? '' : 'data-request="'.$__SELF__.'::onLeaveReview"'; ?>
    >
        <div class="d-flex text-center">
            <div class="form-group flex-fill">
                <label class="control-label d-block"
                       for="quality"><?= lang('igniter.local::default.review.label_quality'); ?></label>
                <div
                    class="h4"
                    data-control="star-rating"
                    data-score="<?= $customerReview ? $customerReview->quality : set_radio('rating[quality]') ?>"
                    data-hints="<?= e(json_encode(array_values($reviewRatingHints))); ?>"
                    data-score-name="rating[quality]"
                    <?= $customerReview ? 'data-read-only="true"' : ''; ?>
                >
                    <div class="rating rating-star text-warning"></div>
                </div>
                <?= form_error('rating.quality', '<span class="text-danger">', '</span>'); ?>
            </div>
            <div class="form-group flex-fill">
                <label class="control-label d-block"
                       for="delivery"><?= lang('igniter.local::default.review.label_delivery'); ?></label>
                <div
                    class="h4"
                    data-control="star-rating"
                    data-score="<?= $customerReview ? $customerReview->delivery : set_radio('rating[quality]') ?>"
                    data-hints="<?= e(json_encode(array_values($reviewRatingHints))); ?>"
                    data-score-name="rating[delivery]"
                    <?= $customerReview ? 'data-read-only="true"' : ''; ?>
                >
                    <div class="rating rating-star text-warning"></div>
                </div>
                <?= form_error('rating.delivery', '<span class="text-danger">', '</span>'); ?>
            </div>
            <div class="form-group flex-fill">
                <label class="control-label d-block"
                       for="service"><?= lang('igniter.local::default.review.label_service'); ?></label>
                <div
                    class="h4"
                    data-control="star-rating"
                    data-score="<?= $customerReview ? $customerReview->service : set_radio('rating[quality]') ?>"
                    data-hints="<?= e(json_encode(array_values($reviewRatingHints))); ?>"
                    data-score-name="rating[service]"
                    <?= $customerReview ? 'data-read-only="true"' : ''; ?>
                >
                    <div class="rating rating-star text-warning"></div>
                </div>
                <?= form_error('rating.service', '<span class="text-danger">', '</span>'); ?>
            </div>
        </div>
        <?php if (!$customerReview) { ?>
            <div class="form-group">
                <label for="review-text"><?= lang('igniter.local::default.review.label_review'); ?></label>
                <textarea
                    name="review_text"
                    id="review-text"
                    rows="5"
                    class="form-control"
                ><?= set_value('review_text'); ?></textarea>
                <?= form_error('review_text', '<span class="text-danger">', '</span>'); ?>
            </div>

            <div class="buttons">
                <button
                    type="submit"
                    class="btn btn-light btn-block text-primary"
                    data-attach-loading=""
                ><?= lang('igniter.local::default.review.button_review'); ?></button>
            </div>
        <?php } else { ?>
            <div class="form-group text-center">
                <p class="lead"><?= $customerReview->review_text ?></p>
            </div>
        <?php } ?>
    </form>
<?php } ?>
